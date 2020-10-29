const puppeteer = require("puppeteer");
const baseUrl = "https://www.instagram.com/thezoomit/";
const fs = require("fs");

(async () => {
  const browser = await puppeteer.launch({
    headless: false,
    userDataDir: "./UserDataDir",
  });
  const page = await browser.newPage();
  page.setDefaultTimeout(500000);
  await page.goto(baseUrl);
  posts = await page
    .$$("main article > div > div[style~='flex-direction:'] > div > div")
    .catch((err) => {
      console.log("Internet problem");
    });
  console.log(`Crawling on ${baseUrl} started!`);
  for (let i = 0; i < 10; i++) {
    await page.goto(baseUrl);
    posts = await page
      .$$("main article > div > div[style~='flex-direction:'] > div > div")
      .catch((err) => {
        console.log("Internet problem");
      });
    await page.waitForSelector(
      "main article > div > div[style~='flex-direction:'] > div > div"
    );

    await posts[i].click();
    for (let j = 0; j < 4; j++) {
      await page
        .waitForSelector("span[aria-label~=Load]", { timeout: 5000 })
        .then(async () => {
          await page.click("span[aria-label~=Load]");
        })
        .catch(() => {});
    }

    await page
      .waitForSelector("h3 > div > span > a", { timeout: 5000 })
      .then(async () => {
        let comments = await page.$$("h3");
        console.log(`Comments of post ${i + 1} Added!`);
        for (const comment of comments) {
          let user = await page.evaluate((text) => text.innerText, comment);
          let text = await page.evaluate(
            (text) => text.nextSibling.innerText,
            comment
          );
          let out = "          " + user + ": " + text + "\r\n";
          fs.appendFile("out.txt", out, () => {});
        }
      })
      .catch((err) => {});
  }
  await page.close();
  console.log("Done, Thank you for using Rotic instgram crawler.");
})();
