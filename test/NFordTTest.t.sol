// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {NFordT} from "../src/NFordT.sol";
import {DeployNFordT} from "../script/DeployNFordT.s.sol";

contract NFordTTest is Test {
    DeployNFordT public deployer;
    NFordT public nFordT;

    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployNFordT();
        nFordT = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "NFordT";
        string memory actualName = nFordT.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        nFordT.mintNft(PUG);

        assert(nFordT.balanceOf(USER) == 1);
    }

    function testTokenURIIsCorrect() public {
        vm.prank(USER);
        nFordT.mintNft(PUG);

        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(nFordT.tokenURI(0)))
        );
    }
}
