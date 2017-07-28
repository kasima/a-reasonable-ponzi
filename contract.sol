pragma solidity ^0.4.11;

contract AReasonablePonzi {
  uint public round;
  uint public startingAmount;
  uint public nextAmount;
  address public lastDepositor;

  function AReasonablePonzi(uint _startingAmount) {
    round = 1;
    startingAmount = _startingAmount;
  }

  function() payable {
    if(round == 1) {
      if(msg.value != startingAmount) {
        revert();
      }
    } else {
      checkAmount(msg.value);
      lastDepositor.transfer(msg.value);
    }

    nextAmount = (msg.value/4) * 5;
    lastDepositor = msg.sender;

    round = round + 1;
  }

  function checkAmount(uint amount) private {
    if(amount != nextAmount) {
      revert();
    }
  }
}
