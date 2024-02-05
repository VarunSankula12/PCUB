
package com.codebook.admin;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hashing {
     public static String[] methodHashing(String[] originalData) throws NoSuchAlgorithmException {
        String[] hashedDataArray = new String[originalData.length];

        for (int i = 0; i < originalData.length; i++) {
            String currentData = originalData[i];

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = digest.digest(currentData.getBytes());

            // Convert the byte array to a hex string
            StringBuilder hexString = new StringBuilder();
            for (byte hashedByte : hashedBytes) {
                String hex = Integer.toHexString(0xff & hashedByte);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            hashedDataArray[i] = hexString.toString();
        }

        return hashedDataArray;
    }
}
/*
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

class Block {
    private String previousHash;
    private String name;
    private String complaint;
    private String date;
    private String location;
    private long timeStamp;
    private int nonce;
    private String hash;

    // Constructor
    public Block(String previousHash, String name, String complaint, String date, String location) {
        this.previousHash = previousHash;
        this.name = name;
        this.complaint = complaint;
        this.date = date;
        this.location = location;
        this.timeStamp = System.currentTimeMillis();
        this.hash = calculateHash();
    }

    // Calculate the hash of the block
    public String calculateHash() {
        String dataToHash = previousHash + Long.toString(timeStamp) + Integer.toString(nonce) +
                name + complaint + date + location;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(dataToHash.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : hashBytes) {
                String hex = Integer.toHexString(0xff & hashByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Mine the block with a given difficulty
    public void mineBlock(int difficulty) {
        String target = new String(new char[difficulty]).replace('\0', '0');
        while (!hash.substring(0, difficulty).equals(target)) {
            nonce++;
            hash = calculateHash();
        }
        System.out.println("Block mined: " + hash);
    }

    // Getters for the fields
    public String getHash() {
        return hash;
    }

    public String getName() {
        return name;
    }

    public String getComplaint() {
        return complaint;
    }

    public String getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }
}

class Blockchain {
    private List<Block> blockchain;
    private int difficulty;

    // Constructor
    public Blockchain(int difficulty) {
        this.blockchain = new ArrayList<>();
        this.difficulty = difficulty;
        // Genesis block
        addBlock(new Block("0", "Genesis", "Default Complaint", "Default Date", "Default Location"));
    }

    // Add a new block to the blockchain
    public void addBlock(Block block) {
        block.mineBlock(difficulty);
        blockchain.add(block);
    }

    // Check if the blockchain is valid
    public boolean isValid() {
        for (int i = 1; i < blockchain.size(); i++) {
            Block currentBlock = blockchain.get(i);
            Block previousBlock = blockchain.get(i - 1);

            if (!currentBlock.getHash().equals(currentBlock.calculateHash())) {
                System.out.println("Block hash is not valid.");
                return false;
            }

            if (!currentBlock.getPreviousHash().equals(previousBlock.getHash())) {
                System.out.println("Previous hash is not valid.");
                return false;
            }
        }
        System.out.println("Blockchain is valid.");
        return true;
    }
}

public class ComplaintBlockchain {
    public static void main(String[] args) {
        // Create a blockchain with difficulty 4
        Blockchain blockchain = new Blockchain(4);

        // Add a block with string data
        blockchain.addBlock(new Block(blockchain.blockchain.get(blockchain.blockchain.size() - 1).getHash(),
                "John Doe", "Poor Service", "2023-01-01", "City A"));

        // Add more blocks with different data
        blockchain.addBlock(new Block(blockchain.blockchain.get(blockchain.blockchain.size() - 1).getHash(),
                "Alice Smith", "Delayed Delivery", "2023-02-15", "City B"));

        blockchain.addBlock(new Block(blockchain.blockchain.get(blockchain.blockchain.size() - 1).getHash(),
                "Bob Johnson", "Defective Product", "2023-03-10", "City C"));

        // Check if the blockchain is valid
        blockchain.isValid();
    }
}

*/








/*
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Block {
    private String previousHash;
    private String name;
    private String complaint;
    private String date;
    private String location;
    private long timeStamp;
    private int nonce;
    private String hash;

    public Block(String previousHash, String name, String complaint, String date, String location) {
        this.previousHash = previousHash;
        this.name = name;
        this.complaint = complaint;
        this.date = date;
        this.location = location;
        this.timeStamp = System.currentTimeMillis();
        this.hash = calculateHash();
    }

    public String calculateHash() {
        String dataToHash = previousHash + Long.toString(timeStamp) + Integer.toString(nonce) +
                name + complaint + date + location;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(dataToHash.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : hashBytes) {
                String hex = Integer.toHexString(0xff & hashByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void mineBlock(int difficulty) {
        String target = new String(new char[difficulty]).replace('\0', '0');
        while (!hash.substring(0, difficulty).equals(target)) {
            nonce++;
            hash = calculateHash();
        }
        System.out.println("Block mined: " + hash);
    }

    public String getHash() {
        return hash;
    }

    public String getName() {
        return name;
    }

    public String getComplaint() {
        return complaint;
    }

    public String getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }
}

public class PoliceComplaintBlockchain {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/complaints";
    private static final String DATABASE_USER = "your_username";
    private static final String DATABASE_PASSWORD = "your_password";

    private static final List<Block> blockchain = new ArrayList<>();
    private static final int DIFFICULTY = 4;

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)) {
            createTableIfNotExists(connection);

            Scanner scanner = new Scanner(System.in);

            // Simulate submitting a complaint
            submitComplaint(connection, "John Doe", "Poor Service", "2023-01-01", "City A");

            // Verify a complaint
            verifyComplaint(connection, "John Doe", "Poor Service", "2023-01-01", "City A");

            scanner.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void createTableIfNotExists(Connection connection) throws SQLException {
        String createTableSQL = "CREATE TABLE IF NOT EXISTS complaints (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "hash VARCHAR(64) NOT NULL," +
                "name VARCHAR(255) NOT NULL," +
                "complaint VARCHAR(255) NOT NULL," +
                "date VARCHAR(10) NOT NULL," +
                "location VARCHAR(255) NOT NULL)";
        try (Statement statement = connection.createStatement()) {
            statement.execute(createTableSQL);
        }
    }

    private static void submitComplaint(Connection connection, String name, String complaint, String date, String location) throws SQLException {
        Block newBlock = new Block(
                blockchain.isEmpty() ? "0" : blockchain.get(blockchain.size() - 1).getHash(),
                name,
                complaint,
                date,
                location
        );
        newBlock.mineBlock(DIFFICULTY);
        blockchain.add(newBlock);

        saveComplaintToDatabase(connection, newBlock);

        System.out.println("Complaint submitted successfully.");
    }

    private static void saveComplaintToDatabase(Connection connection, Block block) throws SQLException {
        String insertSQL = "INSERT INTO complaints (hash, name, complaint, date, location) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
            preparedStatement.setString(1, block.getHash());
            preparedStatement.setString(2, block.getName());
            preparedStatement.setString(3, block.getComplaint());
            preparedStatement.setString(4, block.getDate());
            preparedStatement.setString(5, block.getLocation());
            preparedStatement.executeUpdate();
        }
    }

    private static void verifyComplaint(Connection connection, String name, String complaint, String date, String location) throws SQLException {
        String selectSQL = "SELECT hash FROM complaints WHERE name = ? AND complaint = ? AND date = ? AND location = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(selectSQL)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, complaint);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, location);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String storedHash = resultSet.getString("hash");
                    String calculatedHash = calculateHash(name, complaint, date, location);

                    if (storedHash.equals(calculatedHash)) {
                        System.out.println("Complaint verified. Details: ");
                        System.out.println("Name: " + name);
                        System.out.println("Complaint: " + complaint);
                        System.out.println("Date: " + date);
                        System.out.println("Location: " + location);
                    } else {
                        System.out.println("Error: Complaint data tampered.");
                    }
                } else {
                    System.out.println("Complaint not found.");
                }
            }
        }
    }

    private static String calculateHash(String name, String complaint, String date, String location) {
        String dataToHash = name + complaint + date + location;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(dataToHash.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : hashBytes) {
                String hex = Integer.toHexString(0xff & hashByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}

*/