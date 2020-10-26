const puppeteer = require("puppeteer");
const $ = require("cheerio");
const baseUrl = "https://rahavard365.com/";
const createCsvWriter = require("csv-writer").createObjectCsvWriter;

scrapped = [];
// Save CSV file every 1 minutes
setInterval(() => {
  var date = new Date().getTime();
  const csvWriter = createCsvWriter({
    path: `out/${date}.csv`,
    header: [{ id: "text", title: "Text" }],
  });
  csvWriter.writeRecords(scrapped).then(() => {
    console.log("File saved!");
    scrapped = [];
  });
}, 60000);

(async () => {
  const browser = await puppeteer.launch({ headless: false });
  const page = await browser.newPage();
  await page.setDefaultTimeout(600000);
  await page.setUserAgent(
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/79.0.3945.0 Safari/537.36"
  );
  await page.goto(baseUrl);
  await page.waitForSelector("div.data-box");
  const links = await page.$$("a.symbol");

  for (let i = 0; i < links.length; i++) {
    await page.goto(baseUrl);
    await page.waitForSelector("div.data-box");
    const links = await page.$$eval("a.symbol", (as) => as.map((a) => a.href));
    const link = await links[i];
    await page.goto(link);
    await page.waitForSelector("a.more-posts");
    const button = await page.$("a.more-posts");
    await button.click();
    await page.waitFor(1000);
    await button.click();
    await page.waitFor(1000);
    await button.click();
    await page.waitFor(1000);
    await button.click();
    await page.waitFor(5000);
    const ps = await page.$$eval("p.body-text", (ps) =>
      ps.map((p) => p.innerText)
    );
    console.log(ps.length);
    ps.forEach((p) => {
      scrapped.push({
        text: p,
      });
    });
    var date = new Date().getTime();
    const csvWriter = createCsvWriter({
      path: `out/${date}.csv`,
      header: [{ id: "text", title: "Text" }],
    });
    csvWriter.writeRecords(scrapped).then(() => {
      console.log("File saved!");
      scrapped = [];
    });
  }
})();
