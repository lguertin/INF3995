package com.yellemon.model;

/**
 * The type Local track.
 */
public class LocalTrack {
    private String fileName;
    private String filePath;

    /**
     * Instantiates a new Local track.
     *
     * @param fileName the file name
     * @param filePath the file path
     */
    public LocalTrack(String fileName, String filePath) {
        this.fileName = fileName;
        this.filePath = filePath;
    }

    /**
     * Gets file name.
     *
     * @return the file name
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * Sets file name.
     *
     * @param fileName the file name
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * Gets file path.
     *
     * @return the file path
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * Sets file path.
     *
     * @param filePath the file path
     */
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
