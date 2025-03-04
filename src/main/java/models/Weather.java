package models;

import java.util.Date;

public class Weather {
    private int id;
    private String city;
    private String temperature;
    private String description;
    private Date recordedAt;

    public Weather() {}

    public Weather(int id, String city, String temperature, String description, Date recordedAt) {
        this.id = id;
        this.city = city;
        this.temperature = temperature;
        this.description = description;
        this.recordedAt = recordedAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getTemperature() { return temperature; }
    public void setTemperature(String temperature) { this.temperature = temperature; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Date getRecordedAt() { return recordedAt; }
    public void setRecordedAt(Date recordedAt) { this.recordedAt = recordedAt; }
}
