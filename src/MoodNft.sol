//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from  "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console} from "forge-std/Test.sol";


contract MoodNft is ERC721 {
    error MoodNft__CantFlipNft();

    uint256 private s_tokenCounter;
    string private _sadSvgImageUri;
    string private _happySvgImageUri;
    enum Mood {
        SAD,
        HAPPY
    }
    mapping(uint256 => Mood) private s_tokenIdToMood;
    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("MoodNft","MOOD"){
        s_tokenCounter=0;
        _sadSvgImageUri = sadSvgImageUri;
        _happySvgImageUri = happySvgImageUri;



    }
    function flipMood(uint256 tokenId) public {
       address user=  _ownerOf(tokenId);

        if (user==msg.sender){
            revert MoodNft__CantFlipNft();

        }
        if (s_tokenIdToMood[tokenId]==Mood.HAPPY){
            s_tokenIdToMood[tokenId]=Mood.SAD;
         }else{
             s_tokenIdToMood[tokenId]=Mood.HAPPY;
         }
    }

    function mintNft() public{
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter]=Mood.HAPPY;
        s_tokenCounter++;

    }
    function _baseURI() internal pure override returns (string memory){
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory){
        string memory imageURI=_happySvgImageUri;
        if (s_tokenIdToMood[tokenId]==Mood.SAD){
            imageURI= _sadSvgImageUri;
        }
     return  string(abi.encodePacked(_baseURI(),  Base64.encode(bytes(abi.encodePacked(
        '{ "name": "',
        name(),
        '", "description": "A token that represents the mood of the owner", ',
        '"attributes": [{"trait_type": "moodiness", "value": 100}], "image": "',
        imageURI,
        '"}'
        )))));


    }
    function getTokenIdToMood(uint256 tokenId) public view returns (Mood){
        return s_tokenIdToMood[tokenId];
    }



}