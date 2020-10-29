const puppeteer = require("puppeteer");
const baseUrl = "https://rahavard365.com/";
const createCsvWriter = require("csv-writer").createObjectCsvWriter;
const fs = require("fs");

scrapped = [];

(async () => {
  try {
    const browser = await puppeteer.launch({ headless: false });
    const page = await browser.newPage();
    await page.setDefaultTimeout(50000);
    await page.setUserAgent(
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/79.0.3945.0 Safari/537.36"
    );
    await page.goto(baseUrl);
    await page.waitForSelector("div.data-box");
    const links = await page.$$("a.symbol");

    for (let i = 0; i < links.length; i++) {
      await page.goto(baseUrl);
      await page.waitForSelector("div.data-box");
      const links = await page.$$eval("a.symbol", (as) =>
        as.map((a) => a.href)
      );
      const link = await links[i];
      await page
        .goto(link)
        .then(async () => {
          const button = await page.$("a.more-posts");
          for (let j = 0; j < 5; j++) {
            await page
              .waitForSelector("a.more-posts", { timeout: 3000 })
              .then(async () => {
                await button.click();
              })
              .catch((err) => {});
          }
          await page.waitForTimeout(3000);
          const ps = await page.$$eval("p.body-text", (ps) =>
            ps.map((p) => p.innerText)
          );
          ps.forEach((p) => {
            scrapped.push({
              text: p,
              language: "farsi",
            });
          });
        })
        .then(() => {
          if (scrapped.length !== 0) {
            const data = JSON.stringify(scrapped);
            fs.writefile("index.json", data, (err) => {
              console.log("hello");
              scrapped = [];
            });
          }
        })
        .catch((err) => {});
    }
  } catch (err) {
    console.log(err);
  }
  console.log("Done");
})();
