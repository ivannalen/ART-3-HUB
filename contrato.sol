// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NounPassport {
    
    struct User {
        string name;
        string path; // arte, comunidad, dev, etc.
        uint progress; // número de etapas completadas
        bool exists;
    }

    mapping(address => User) public users;

    event UserRegistered(address user, string name, string path);
    event ProgressUpdated(address user, uint newProgress);

    function register(string memory _name, string memory _path) public {
        require(!users[msg.sender].exists, "Usuario ya registrado");
        users[msg.sender] = User(_name, _path, 0, true);
        emit UserRegistered(msg.sender, _name, _path);
    }

    function completeStage() public {
        require(users[msg.sender].exists, "Usuario no registrado");
        users[msg.sender].progress += 1;
        emit ProgressUpdated(msg.sender, users[msg.sender].progress);
    }

    function getProgress(address _user) public view returns (uint) {
        return users[_user].progress;
    }
}

Agrego contrato desde Remix
