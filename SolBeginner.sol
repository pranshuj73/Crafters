// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public tokenName;
    string public tokenAbbreviation;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _abbr, uint256 _initSupply) {
        tokenName = _name;
        tokenAbbreviation = _abbr;
        totalSupply = _initSupply;
        owner = msg.sender;
    }

    function mint(address _recipient, uint256 _value) public {
        require(msg.sender == owner, "UNAUTHORIZED! Only Owner can mint!!");
        totalSupply += _value;
        balances[_recipient] += _value;
    }

    function burn(address _target, uint256 _value) public {
        require(msg.sender == owner, "UNAUTHORIZED! Only the owner can burn tokens!!!!");
        require(balances[_target] >= _value, "No balance to burn :p");
        totalSupply -= _value;
        balances[_target] -= _value;
    }
}
