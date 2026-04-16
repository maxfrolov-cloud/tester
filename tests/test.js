const { Builder, By } = require('selenium-webdriver');
const chrome = require('selenium-webdriver/chrome');

(async function test() {
  let options = new chrome.Options();

  options.addArguments('--headless=new'); // oluline
  options.addArguments('--no-sandbox');   // kriitiline
  options.addArguments('--disable-dev-shm-usage'); // kriitiline
  options.addArguments('--disable-gpu');

  let driver = await new Builder()
    .forBrowser('chrome')
    .setChromeOptions(options)
    .build();

  await driver.get('http://localhost:5500/app/index.html');

  let text = await driver.findElement(By.id('title')).getText();
  console.log(text);

  await driver.quit();
})();