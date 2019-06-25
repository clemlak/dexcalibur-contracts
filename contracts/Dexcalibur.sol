/* solhint-disable no-empty-blocks */

pragma solidity 0.5.7;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";


/**
 * @title An amazing project called Dexcalibur
 * @dev This contract is the base of our project
 */
contract Dexcalibur is ERC721Full {
    address public king = 0x483d975B4de8AA91D319FB3Cf3b715Bc09E53990;
    uint256 public price = 0.01 ether;
    bool public kingHasBeenFound = false;

    enum State { Unkown, Peasant, King }
    mapping (address => State) public states;

    event LogKingHasBeenFound();
    event LogAnotherPeasant(address indexed peasant);

    constructor() public ERC721Full(
        "Dexcalibur",
        "DXCL"
    ) {
    }

    function amITheKing() external payable returns (bool) {
        require(
            kingHasBeenFound == false,
            "The king has already been found"
        );

        require(
            msg.value == price,
            "The price is not right"
        );

        if (msg.sender == king) {
            kingHasBeenFound = true;
            _mint(msg.sender, 0);
            _setTokenURI(0, "https://ipfs.globalupload.io/QmVncbmEBg53YMytFdr2L4kvTsn5BmbkneNWskM1J1Bnvr");

            states[msg.sender] = State.King;

            bool transfer = msg.sender.send(address(this).balance);
            require(transfer == true, "Funds transfer failed");

            emit LogKingHasBeenFound();

            return true;
        }

        states[msg.sender] = State.Peasant;

        emit LogAnotherPeasant(msg.sender);
        return false;
    }

    function getPot() external view returns (uint256) {
        return address(this).balance;
    }
}
