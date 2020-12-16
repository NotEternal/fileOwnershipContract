pragma solidity >=0.7.4;

// transaction hash - 0x58b8ec2bd1cfcb2fccfe41a120f6509c2c6280436915158cc430b0d5d29a5858
// deploy contract address - 0xc6Dfe253675B401e6EC499f7932cF94630bB428A

contract FileOwnership {
    struct FileInfo {
        uint timestamp;
        string owner;
    }

    mapping (string => FileInfo) files;

    event LogFileAddedStatus(
        bool status,
        uint timestamp,
        string owner,
        string fileHash
    );

    function set(string memory owner, string memory fileHash) public {
        if (files[fileHash].timestamp == 0) {
            files[fileHash] = FileInfo(block.timestamp, owner);
            emit LogFileAddedStatus(true, block.timestamp, owner, fileHash);
        } else {
            emit LogFileAddedStatus(false, block.timestamp, owner, fileHash);
        }
    }

    function get(string memory fileHash) view public returns (
        uint timestamp,
        string memory owner
    ) {
        return (files[fileHash].timestamp, files[fileHash].owner);
    }
}