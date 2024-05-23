// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "https://github.com/ayush200144/counter/blob/main/counters.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract NFT is ERC721URIStorage {
    using CustomCounters for CustomCounters.Counter;
    CustomCounters.Counter private _tokenIds;
    address public owner;

    constructor() ERC721("Moon NFTS", "Moon") {
        owner = msg.sender;
    }

    function createToken() public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        string memory tokenURI = string(abi.encodePacked(
            "https://firebasestorage.googleapis.com/v0/b/nfts-25c5b.appspot.com/o/metadata%2F", 
            Strings.toString(newItemId), 
            ".json?alt=media&token=54d63d19-cda5-40ba-8d69-1bcdb8042389"
        ));

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
