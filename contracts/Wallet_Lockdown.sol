// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockedWallet {
    address private owner=msg.sender;  
    uint private releaseTime;  

    receive() external  payable { }

    function lock_wallet() public{
        releaseTime = block.timestamp + 30;
    }

    function withdraw() public{
        require(block.timestamp >= releaseTime, "Wallet locked");
        payable(owner).transfer(address(this).balance); 
    }
}
