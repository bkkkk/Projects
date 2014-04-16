#!/usr/bin/ruby

require 'net/imap'

class Account

  @@accounts = {}

  attr_reader :name, :address, :username, :password

  def initialize(name, address, username, password)
    @name     = name
    @address  = address
    @username = username
    @password = password
    @@accounts[name] = self
  end

  def self.accounts
    @@accounts
  end

  def self.list_accounts
    puts "Registered accounts"
    puts "==================="
    @@accounts.map { |e| puts "* #{e.name}"  }
  end

  def to_s
    "Name: #{name}, Address: #{address}"
  end
end

class Email

  def initialize(accounts)
    @accounts = accounts
  end

  def list_email(account_name)
    
    # Load account
    account   = @accounts[account_name]

    # Get account information
    username  = account.username
    password  = account.password
    address   = account.address

    # Load emails
    puts "Loading emails from #{address}"
    imap = Net::IMAP.new(address)
    imap.authenticate('LOGIN', username, password)
    
    imap.examine('INBOX')
    imap.search(["RECENT"]).each do |message_id|
      envelope = imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
      puts "#{envelope.from[0].name}: \t#{envelope}"
    end
  end
end

if __FILE__ == $0
  Account.new('rhul', 'outlook.office365.com', 'zrap013@live.rhul.ac.uk', 'Jacobla88')
  
  client = Email.new(Account.accounts)
  
  client.list_email('rhul')
end
