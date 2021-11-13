package servlet;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.text.SimpleDateFormat;

class TestDateServlet {
 
    @Test
    public void testDateServlet() {
        assertEquals(DateServlet.PATTERN, "MM-dd-yyyy");
    }

    @Test
    public void testDate() {
        String pattern = "MM-dd-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(new Date());

        DateServlet ds = new DateServlet();
        assertEquals(date, ds.getDate());
    }
}