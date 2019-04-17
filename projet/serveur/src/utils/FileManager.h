#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <mutex>

#define ENTRY_SEPARTOR '\n'
#define FIELD_DELIMITOR '\t'

using namespace std;

/*********************************************************
* Class          : FileManager
* Description    : Represents a text file handler
*********************************************************/
template<typename T>
class FileManager {
private:
    string file_name;
    mutex file_access_mutex;

public:
    FileManager(string file_name);

    T read_row(string field);
    void add_row(T data);
    bool delete_row(string field);
    bool modify_row(string field, T data);
    vector<T> get_all_rows();

protected:
    virtual void parse_line(string line, T& data) = 0;
    virtual bool verify_condition(T data, string field) = 0;
    virtual string data_to_string(T data) = 0;

private:
    void write_rows(vector<T> rows);
};

/*
* Constructor with one database file name as parameter 
*/
template<typename T>
FileManager<T>::FileManager(string file_name) {
    this->file_name = "database/" + file_name;
}	

/***************************************************************************
* Method         : read_row
* Description    : Open the file and reads it to get the right fields 
***************************************************************************/
template<typename T>
T FileManager<T>::read_row(string field) {
    string line;
    T retreived_data;

    lock_guard<mutex> lock(file_access_mutex);

    ifstream file_istream(file_name);

    while(getline(file_istream, line)) {
        T line_data;
        parse_line(line, line_data);

        if (verify_condition(line_data, field)) {
            retreived_data = line_data;
            break;
        }
    }

    file_istream.close();

    return retreived_data;
}

/***************************************************************************
* Method         : add_row
* Description    : Open the file and write a new line at the end  
***************************************************************************/
template<typename T>
void FileManager<T>::add_row(T data) {
    ofstream file_ostream;

    lock_guard<mutex> lock(file_access_mutex);
    file_ostream.open(file_name, std::ios::app);

    file_ostream << data_to_string(data) << ENTRY_SEPARTOR;

    file_ostream.close();
}

/***************************************************************************
* Method         : delete_row
* Description    : Remove the line that contains this field value
***************************************************************************/
template<typename T>
bool FileManager<T>::delete_row(string field) {
    bool found_entry = false;
    vector<T> rows = get_all_rows();

    for(auto it = rows.begin(); it != rows.end(); it++) {
        if (verify_condition(*it, field)) {
            rows.erase(it);
            found_entry = true;
            break;
        }
    }

    write_rows(rows);

    return found_entry;
}

/***************************************************************************
* Method         : modify_row
* Description    : Modify the line that contains this field with the given value
***************************************************************************/
template<typename T>
bool FileManager<T>::modify_row(string field, T data) {
    bool found_entry = false;
    vector<T> rows = get_all_rows();

    for(auto it = rows.begin(); it != rows.end(); it++) {
        if (verify_condition(*it, field)) {
            *it = data;
            found_entry = true;
            break;
        }
    }

    write_rows(rows);

    return found_entry;
}

/***************************************************************************
* Method         : get_all_rows
* Description    : Read the file and returns its content
***************************************************************************/
template<typename T>
std::vector<T> FileManager<T>::get_all_rows() {
    vector<T> rows;
    string line;

    lock_guard<mutex> lock(file_access_mutex);
    ifstream file_istream(file_name);

    while(getline(file_istream, line)) {
        T row_data;
        parse_line(line, row_data);
        rows.push_back(row_data);
    }

    file_istream.close();

    return rows;
}

/***************************************************************************
* Method         : write_rows
* Description    : Open a file and write all the rows it it
***************************************************************************/
template<typename T>
void FileManager<T>::write_rows(vector<T> rows) {
    lock_guard<mutex> lock(file_access_mutex);
    ofstream file_ostream(file_name, ios::trunc);
    for (auto it = rows.begin(); it != rows.end(); it++) {
        file_ostream << data_to_string(*it)  << ENTRY_SEPARTOR;
    }
    file_ostream.close();
}

#endif