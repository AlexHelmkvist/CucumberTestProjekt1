package purchase;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.After;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class PåskStepDef {
    private WebDriver driver;


    @Given("User is using {string}")
    public void userIsUsing(String browser) {
        switch (browser) {
            case "Edge" -> driver = new EdgeDriver();
            case "Firefox" -> driver = new FirefoxDriver();
            case "Chrome" -> driver = new ChromeDriver();
        }

    }

    @Given("The User navigates to the website")
    public void theUserNavigatesToTheWebsite() {
        driver.get("https://www.partykungen.se/?utm_source=www.partykungen.se&utm_medium=messagebox&utm_campaign=www.partykungen.se%20messagebox");
    }

    @When("The user types search {string}")
    public void theUserTypesSearch(String words) {
        click(driver, By.cssSelector("#onetrust-accept-btn-handler"));
        driver.manage().window().setSize(new Dimension(1333, 826));
        driver.findElement(By.cssSelector(".w-full > #searchBox")).sendKeys(words);
        driver.findElement(By.cssSelector(".w-full > #searchBox")).sendKeys(Keys.ENTER);

    }

    @And("The user {string} the desired product")
    public void theUserTheDesiredProduct(String selects) {
        switch (selects) {
            case "påskägg" -> click(driver, By.cssSelector("img[alt='paskagg-30-cm-1']"));
            case "käpp" -> click(driver, By.cssSelector("img[alt='kapp-med-plunta-och-ringklocka-5']"));
            case "prime" ->
                    click(driver, By.cssSelector("img[alt='prime-hydration-sports-drink-blue-raspberry-93135-1']"));
            case "godis" -> click(driver, By.cssSelector("img[alt='gigantisk-choklad-kexchoklad-77524-2']"));
        }

    }

    @And("The user {string} an item in the cart")
    public void theUserAnItemInTheCart(String places) throws InterruptedException {
        if (places.equals("click")) {
            Thread.sleep(2000);
            click(driver, By.cssSelector("#addToCartText"));
        }

    }

    @Then("The user goes to the shopping {string}")
    public void theUserGoesToTheShopping(String cart) {
        if (cart.equals("cart")) {
            click(driver, By.cssSelector(".pk-button-add-to-cart > .text-md"));
            click(driver, By.cssSelector(".md\\3Amt-4"));
            assertThat(driver.findElement(By.cssSelector(".text-5xl")).getText(), is("Kassa"));
            driver.close();
        }

    }

    public static void click(WebDriver driver, By by) {

        (new WebDriverWait(driver, Duration.ofSeconds(30))).until(ExpectedConditions.elementToBeClickable(by));

        driver.findElement(by).click();

    }

}

