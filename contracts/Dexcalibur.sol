pragma solidity 0.5.7;

import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";


/**
 * @title An amazing project called Dexcalibur
 * @dev This contract is the base of our project
 */
contract Dexcalibur {
    address public manaTokenAddress;
    uint256 public price = 0.01 ether;
    bytes32 private solution = 0x4cc3df42c1d0dbd50175993afd98ef80447c81eb1387c9ef1b51751e31c8c63d;
    bool public isGameOpen = true;

    event LogSolutionFound(address indexed winner);
    event LogAnotherPeasant(address indexed peasant);

    constructor(address initialManaTokenAddress) public {
        manaTokenAddress = initialManaTokenAddress;
    }

    /**
     * @dev Submits an answer
     * @param x A parameter
     * @param y Another parameter
     * @param z Yet another parameter
     * @return True if the solution is valid
     */
    function submitAnswer(
        uint256 x,
        uint256 y,
        uint256 z
    ) external payable returns (
        bool
    ) {
        require(isGameOpen == true, "Game is already over");
        require(msg.value == price, "Wrong price");

        IERC20 manaToken = IERC20(manaTokenAddress);
        uint256 balance = manaToken.balanceOf(msg.sender);

        if (keccak256(abi.encodePacked(x, y, z, balance)) == solution) {
            isGameOpen = false;
            bool transfer = msg.sender.send(address(this).balance);
            emit LogSolutionFound(msg.sender);
            require(transfer == true, "Transfer failed");

            return true;
        } else {
            emit LogAnotherPeasant(msg.sender);

            return false;
        }
    }
}
