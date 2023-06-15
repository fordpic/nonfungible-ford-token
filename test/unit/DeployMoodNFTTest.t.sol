// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToURI() public view {
        string memory expectedURI = "";
        string
            memory svg = '<svg width="500" height="500" viewBox="0 0 285 350" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill="black" d="M150,0,L75,200,L225,200,Z"></path></svg>';

        string memory actualURI = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualURI)) ==
                keccak256(abi.encodePacked(expectedURI))
        );
    }
}
