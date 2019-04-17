
#ifndef UTILS_H
#define UTILS_H

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>


using namespace std;


/***************************************************************
* Class         : Utils
* Desciption    : Utility functions.
****************************************************************/
class Utils {

    private:
    public: 

        // Method taken from : http://www.cplusplus.com/articles/2wA0RXSz/
        static const vector<string> split(const string& s, const char& c) {
            string buff{""};
            vector<string> v;
            
            for(auto n:s)
            {
                if(n != c) buff+=n; else
                if(n == c && buff != "") { v.push_back(buff); buff = ""; }
            }
            if(buff != "") v.push_back(buff);
            
            return v;
        }

};

#endif