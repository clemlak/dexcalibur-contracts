/* solhint-disable no-empty-blocks */

pragma solidity 0.5.7;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";


/**
 * @title An amazing project called Dexcalibur
 * @dev This contract is the base of our project
 */
contract Dexcalibur is ERC721Full {
    address public king = 0x653036dDd25CeB5Ecc2D933f27e33D95C23F1043;
    uint256 public price = 0.01 ether;
    bool public kingHasBeenFound = false;

    constructor() public ERC721Full(
        "Dexcalibur",
        "DXCL"
    ) {
    }

    function amITheKing() external payable {
        require(
            kingHasBeenFound == false,
            "The king has already been found"
        );

        require(
            msg.value == price,
            "The price is not right"
        );

        require(
            msg.sender == king,
            "You are not the king"
        );

        kingHasBeenFound = true;
        _mint(msg.sender, 0);
        _setTokenURI(0, "https://ipfs.globalupload.io/QmVncbmEBg53YMytFdr2L4kvTsn5BmbkneNWskM1J1Bnvr");
    }
}
