class Wallet {
  double balance;

  Wallet(this.balance);

  void deposit(double amount) {
    if (amount <= 0) {
      throw Exception('Deposit amount must be greater than zero.');
    }
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdraw amount must be greater than zero.');
    }
    if (balance < amount) {
      throw Exception('Insufficient funds.');
    }
    balance -= amount;
  }
}
