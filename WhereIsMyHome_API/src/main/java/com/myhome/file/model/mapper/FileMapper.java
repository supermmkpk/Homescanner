package com.myhome.file.model.mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface FileMapper {

    @Insert("INSERT INTO files (file_name, path) VALUES (#{fileName}, #{path})")
    void insertFileInfo(String fileName, String path);

    @Select("SELECT path FROM files WHERE file_name = #{fileName}")
    String selectPathByFileName( String fileName);
}
