package dao;

import models.Weather;

import java.sql.SQLException;
import java.util.List;

public interface WeatherDAO {
    List<Weather> getAllWeather();
    Weather getWeatherById(int id);
    void addWeather(Weather weather);
    void updateWeather(Weather weather) throws SQLException;
    void deleteWeather(int id);
}
