package controllers;

import dao.WeatherDAO;
import daoImpl.WeatherDAOImpl;
import models.Weather;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

//@WebServlet("/weather")
public class WeatherController extends HttpServlet {
    private WeatherDAO weatherDAO = new WeatherDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Weather weather = weatherDAO.getWeatherById(id);
            request.setAttribute("weather", weather);
            request.getRequestDispatcher("/editWeather.jsp").forward(request, response);
        } else {
            List<Weather> weatherList = weatherDAO.getAllWeather();
            request.setAttribute("weatherList", weatherList);
            request.getRequestDispatcher("/weather.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String city = request.getParameter("city");
            String temperature = request.getParameter("temperature");
            String description = request.getParameter("description");

            Weather weather = new Weather();
            weather.setId(id);
            weather.setCity(city);
            weather.setTemperature(temperature);
            weather.setDescription(description);

            try {
                weatherDAO.updateWeather(weather);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("add".equals(action)) {
            String city = request.getParameter("city");
            String temperature = request.getParameter("temperature");
            String description = request.getParameter("description");

            Weather weather = new Weather();
            weather.setCity(city);
            weather.setTemperature(temperature);
            weather.setDescription(description);

            weatherDAO.addWeather(weather);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            weatherDAO.deleteWeather(id);
        }

        response.sendRedirect(request.getContextPath() + "/weather");
    }
}