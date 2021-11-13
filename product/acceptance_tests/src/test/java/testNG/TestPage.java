package testNG;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.Assert;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class TestPage {
  
	private static WebDriver driver;
	private static String serverBaseURL= System.getProperty("serverBaseURL");
	private static String webpageURI= "/product";
	private static String dateservletURI= "/product/DateServlet";

	@BeforeTest
	public static void configureDriver() throws MalformedURLException {
		final ChromeOptions chromeOptions = new ChromeOptions();
		chromeOptions.addArguments("--headless");
		chromeOptions.addArguments("--no-sandbox");
		chromeOptions.addArguments("--disable-dev-shm-usage");
		chromeOptions.addArguments("--window-size=1200x600");

		chromeOptions.setBinary("/usr/bin/google-chrome");
		DesiredCapabilities capability = DesiredCapabilities.chrome();
		capability.setBrowserName("chrome");
		capability.setPlatform(Platform.LINUX);

		capability.setCapability(ChromeOptions.CAPABILITY, chromeOptions);

		driver = new RemoteWebDriver(new URL("http://selenium__standalone-chrome:4444/wd/hub"), capability);
	}	
	
	
	@Test
	public static void testContent() throws InterruptedException {
		driver.get(serverBaseURL+webpageURI);
		Thread.sleep(500);
		String expectedString= "This page is made by Vinicius Amaro Cechin!";
		String actualString= driver.findElement(By.id("content")).getText();
		Assert.assertEquals(expectedString, actualString);
	}

	@Test
	public static void testOtherContent() throws InterruptedException {
		driver.get(serverBaseURL+dateservletURI);
		Thread.sleep(500);
		String expectedString= "This is a date servlet!";
		String actualString= driver.findElement(By.id("introduction")).getText();
		Assert.assertEquals(expectedString, actualString);
	}
	
	@Test
	public static void testTime() throws InterruptedException {
		driver.get(serverBaseURL+dateservletURI);
		Thread.sleep(500);
		String actualDate= driver.findElement(By.id("date")).getText();
		
		String pattern = "MM-dd-yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		String expectedDate= "Today is " + date;

		Assert.assertEquals(expectedDate, actualDate);
	}
	
		
	@AfterSuite
	public static void closeDriver() {
		driver.quit();
	}
	
	
}
