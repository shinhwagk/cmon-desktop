import * as fs from "fs"
import * as path from "path"

import { endpoints as eps } from "../../endpoint/linux";

const common = { name: "cron-loadavg", cron: "*/1 * * * *", args: [] }

const endpoints = eps;

function fusion() {
    return endpoints.map(endpoint => { return { name: "cron-loadavg", endpoint: endpoint, cron: "*/1 * * * *", args: [] } })
}

const config = JSON.stringify(fusion());
fs.writeFileSync(path.join(__dirname, "loadavg.cache.json"), config);