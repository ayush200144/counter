// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Counter is Ownable {
    uint256 private _count;

    event CountedTo(uint256 number);

    constructor() {
        _count = 0;
    }

    function count() public onlyOwner {
        _count += 1;
        emit CountedTo(_count);
    }

    function getCount() public view returns (uint256) {
        return _count;
    }

    function resetCount() public onlyOwner {
        _count = 0;
        emit CountedTo(_count);
    }
}

