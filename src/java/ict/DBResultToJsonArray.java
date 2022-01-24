/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict;

import org.json.JSONArray;
import org.json.JSONObject;
import java.sql.ResultSet;

/**
 *
 * @author simon
 */


public class DBResultToJsonArray {
    public JSONArray convert(ResultSet resultSet) throws Exception {
 
    JSONArray jsonArray = new JSONArray();
 
    while (resultSet.next()) {
 
        int columns = resultSet.getMetaData().getColumnCount();
        JSONObject obj = new JSONObject();
 
        for (int i = 0; i < columns; i++)
            obj.put(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getObject(i + 1));
 
        jsonArray.put(obj);
    }
    return jsonArray;
}
}
