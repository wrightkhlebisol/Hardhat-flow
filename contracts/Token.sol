// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract Token {
    string public name = "Hardhat Test Token";
    string public symbol = "NDT";
    uint public totalSupply = 1000000;

    mapping(address => uint) balances;

    constructor(){
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) external{
        require(balances[msg.sender] >= amount, "Not enough token");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint){
        return balances[account];
    }
 }