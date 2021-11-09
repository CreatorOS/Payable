# Payable

Solidity provides a native way to send money to smart contract and other accounts.
While in other languages functions can take only parameters, solidity functions can take money `ether` alongwith parameters as an input.
Functions and addresses declared `payable` can receive `ether` into the contract.

`msg.value` variable can be used to access the amount of ether sent to a `payable` function.

We already have a boilerplate contract named `Payable`.
Let's build on top of that some function to learn how `payable` functionality works.

## Deposit function

Let's write a function to deposit function that is `payable` to deposit ethers into our smart contract.

This is deposit function:

```
function deposit() public payable {}
```

It's as simple as that the function need `payable` keyword in function definition and that's it.
Now when we call this function with some ether, it will get automatically deposited in smart contract.

Hit `Run` and in 2nd test output, you will see we deposited 1 ether into smart contract by using this `deposit()` function.

## Sending ether to nonpayable function

Let's see what happens when we send `ether` to a nonpayable function.

Code this up:

```
    function notPayable() public {}
```

Hit `Run`. You will see in 3rd test output this function throws `non-payable method cannot override value` error when called by passing `ether`.

## Withdraw function

Now, let's see how we can withdraw all Ether from this contract.

Let's write a `withdraw()` function:

```
    function withdraw() public {
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }
```

In the above function we are uisng `address(this).balance` to get the amount of Ether stored in this contract.
After that we are sending all the `ether` to the address of the owner by calling `call()` function on the address and passing the amount in `value`.

Hit `Run`. You will see in 4th test output that the `ethers` amount increased in owner's address after calling `withdraw()`.

## Transfer function

Now, let's see how to transfer `ether` to a specific address from this contract.

Code this `transfer()` function:

```
    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "failed to send ether");
    }
```

Here, we are getting the receiver's address in parameter `_to`.
Note that `_to` is declared as payable so that it can receive the `ether`.
We use the same function `call()` which we used earlier to transfer the `ether` to that address.

Hit `Run`. You will see in the 5th test output the receiver's balance increased after calling `transfer()`.
