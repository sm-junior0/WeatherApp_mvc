package daoImpl;

import dao.WeatherDAO;
import models.Weather;
import utility.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WeatherDAOImpl implements WeatherDAO {
    @Override
    public List<Weather> getAllWeather() {
        List<Weather> weatherList = new ArrayList<>();
        String sql = "SELECT * FROM weather";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Weather weather = new Weather(
                        rs.getInt("id"),
                        rs.getString("city"),
                        rs.getString("temperature"),
                        rs.getString("description"),
                        rs.getDate("recorded_at")
                );
                weatherList.add(weather);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weatherList;
    }

    @Override
    public Weather getWeatherById(int id) {
        Weather weather = null;
        String sql = "SELECT * FROM weather WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                weather = new Weather(
                        rs.getInt("id"),
                        rs.getString("city"),
                        rs.getString("temperature"),
                        rs.getString("description"),
                        rs.getDate("recorded_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return weather;
    }

    @Override
    public void addWeather(Weather weather) {
        String sql = "INSERT INTO weather (city, temperature, description, recorded_at) VALUES (?, ?, ?, NOW())";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, weather.getCity());
            ps.setString(2, weather.getTemperature());
            ps.setString(3, weather.getDescription());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateWeather(Weather weather) {
        String sql = "UPDATE weather SET city=?, temperature=?, description=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, weather.getCity());
            ps.setString(2, weather.getTemperature());
            ps.setString(3, weather.getDescription());
            ps.setInt(4, weather.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteWeather(int id) {
        String sql = "DELETE FROM weather WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            System.out.println("Rows deleted: " + rowsDeleted);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error deleting weather record: " + e.getMessage());
        }
    }
}
