package com.myhome.file.model.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.file.model.mapper.FileMapper;

@Service
public class FileService {

    @Autowired
    private FileMapper fileMapper;

    public void saveFileInfo(String fileName, String filePath) {
        fileMapper.insertFileInfo(fileName, filePath);
    }

    public String selectPathByFileName(String fileName) {
        return fileMapper.selectPathByFileName(fileName);
    }
}
