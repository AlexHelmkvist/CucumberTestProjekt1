package user;

import io.cucumber.java.en.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import java.util.Random;
import static org.junit.Assert.assertEquals;

public class userStepDef {
    private WebDriver driver;

    @Given("User uses as {string}")
    public void userUsesAs(String browser) {
        switch (browser) {
            case "Edge" -> driver = new EdgeDriver();
            case "Firefox" -> driver = new FirefoxDriver();
            case "Chrome" -> driver = new ChromeDriver();
        }

    }
    @And("The user is on the registration page")
    public void theUserIsOnTheRegistrationPage() {
        driver.get("https://membership.basketballengland.co.uk/NewSupporterAccount");
    }

    @When("User Enters Date of Birth {string}")
    public void userEntersDateOfBirth(String birth_date) {
        driver.findElement(By.id("dp")).sendKeys(birth_date);
        System.out.println(birth_date);
    }

    @And("The user enters their first name {string}")
    public void theUserEntersTheirFirstName(String first_name) {
        driver.findElement(By.id("member_firstname")).sendKeys(first_name);
        System.out.println(first_name);
    }

    @And("The user enters his last name {string}")
    public void theUserEntersHisLastName(String last_name) {
        driver.findElement(By.id("member_lastname")).sendKeys(last_name);
        System.out.println(last_name);
    }

    @But("If last name is not specified {string}")
    public void ifLastNameIsNotSpecified(String last_name) {
        if (last_name.equals(" ")) {
            System.out.println(last_name);
        }
    }

    @And("The user enters his email address and confirms")
    public void theUserEntersHisEmailAddressAndConfirms() throws InterruptedException {
        Random rand = new Random();
        int min = 1000;
        int max = 9999;
        int randomNumber = rand.nextInt(max - min + 1) + min;
        Thread.sleep(3000);
        String firstString = "sasha";
        String thirdString = "@mail.ru";
        String mail = firstString + randomNumber + thirdString;
        driver.findElement(By.id("member_emailaddress")).sendKeys(mail);
        System.out.println(mail);
        driver.findElement(By.id("member_confirmemailaddress")).sendKeys(mail);
        System.out.println(mail);
    }

    @And("The user enters their {string}")
    public void theUserEntersTheir(String pass1) {
        driver.findElement(By.id("signupunlicenced_password")).sendKeys(pass1);
        System.out.println(pass1);
    }

    @And("The user repeats his {string}")
    public void theUserRepeatsHis(String pass2) {
        driver.findElement(By.id("signupunlicenced_confirmpassword")).sendKeys(pass2);
        System.out.println(pass2);
    }

    @And("The User agrees to {string}")
    public void theUserAgreesTo(String terms_and_conditions) {
        if (terms_and_conditions.equals("klick")) {
            click(driver, By.cssSelector(".md-checkbox > .md-checkbox:nth-child(1) .box"));
        }
    }

    @And("The user accepts the age limit")
    public void theUserAcceptsTheAgeLimit() {
        click(driver, By.cssSelector(".md-checkbox:nth-child(2) > label > .box"));
    }

    @And("The User approves Code of Ethics")
    public void theUserApprovesCodeOfEthics() {
        click(driver, By.cssSelector(".md-checkbox:nth-child(7) .box"));
    }

    @And("The user clicks the registration button")
    public void theUserClicksTheRegistrationButton() {
        click(driver, By.name("join"));
    }

    @Then("Should the user account be created successfully{string}")
    public void shouldTheUserAccountBeCreatedSuccessfully(String expected) {
        if (expected.equals("account_created")) {
            String actual = driver.findElement(By.cssSelector(".bold:nth-child(1)")).getText();
            assertEquals("THANK YOU FOR CREATING AN ACCOUNT WITH BASKETBALL ENGLAND", actual);
            System.out.println(actual);
            driver.close();
        }
        if (expected.equals("surname_missing")) {
            String actual = driver.findElement(By.cssSelector("span[for='member_lastname']")).getText();
            assertEquals("Last Name is required", actual);
            System.out.println(actual);
            driver.close();

        }
        if (expected.equals("password_does_not_match")) {
            String actual = driver.findElement(By.cssSelector("span[for='signupunlicenced_confirmpassword']")).getText();
            assertEquals("Password did not match", actual);
            System.out.println(actual);
            driver.close();
        }
        if (expected.equals("terms_and_conditions")) {
            String actual = driver.findElement(By.cssSelector("span[for='TermsAccept']")).getText();
            assertEquals("You must confirm that you have read and accepted our Terms and Conditions", actual);
            System.out.println(actual);
            driver.close();
        }
    }
    public static void click(WebDriver driver, By by) {

        (new WebDriverWait(driver, Duration.ofSeconds(10))).until(ExpectedConditions.elementToBeClickable(by));

        driver.findElement(by).click();

    }



}
