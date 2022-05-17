// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MikeTestToken is Ownable, ERC20 {

    event eventFlipIsActive();
    event eventSetMessage(string);
    event eventMint(address, uint256);
    event eventBurn(address, uint256);

    bool public isActive =false;
    string public myMessage = "world";
    constructor() public ERC20("MiktTestToken", "MTT") {
        isActive =false;
     }
     function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    function mint(uint256 amount) public {
        require(isActive, "isActive is not true");
        _mint(msg.sender, amount);
        emit eventMint(msg.sender,amount);
    }

    function burn(uint256 amount) public {
        require(isActive, "isActive is not true");
        _burn(msg.sender, amount);
        emit eventBurn(msg.sender, amount);
    }

    function flipIsActive () public {
        isActive =! isActive;
        emit eventFlipIsActive();
    }
    
    function setMessage (string memory message) public  {
        require(isActive, "isActive is not true");
        myMessage =message;
        emit eventSetMessage(message);
    }
    function showMessage () public returns (string memory){
        return myMessage;
    }

}