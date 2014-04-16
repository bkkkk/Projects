#!/usr/bin/ruby

class Account

  @@accounts = []

  attr_reader :name, :address, :username, :password

  def initialize(name, address, username, password)
    @name     = name
    @address  = address
    @username = username
    @password = password
    @@accounts << self
  end

  def self.accounts
    @@accounts
  end

  def self.list_accounts
    puts "Registered accounts"
    puts "==================="
    @@accounts.map { |e| puts "* #{e.name}"  }
  end
end

class Email

  def initialize(accounts)
    @accounts = accounts
    Account.list_accounts
  end

  def list_email(account)
    imap = Net::IMAP.new('')
    imap.authenticate()
  end
end

if __FILE__ == $0
  Account.new('Gmail', 'office365.outlook.com', 'zrap013', 'Jacobla88')
  Account.new('RHUL', 'office365.outlook.com', 'zrap013', 'Jacobla88')
  client = Email.new(Account.accounts)
end
