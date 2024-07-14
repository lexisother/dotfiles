#!/usr/bin/env node

import * as fs from 'fs';
import { $ } from 'zx';
import argparse from 'argparse';

let parser = new argparse.ArgumentParser();

parser.add_argument('INPUT_FILE', {
  help: 'Path to .mrpack file',
});

let args = parser.parse_args();

$.sync`unzip -o ${args.INPUT_FILE} -d output`;
$.sync`chmod 755 output/modrinth.index.json`;

let index = JSON.parse(fs.readFileSync("output/modrinth.index.json").toString());
for (const mod of index.files) {
  /** @type {string} */
  let download = mod.downloads[0];
  let modId = download.match(/data\/(.+?)\//)[1];

  $({sync: true, verbose: true})`ferium add ${modId}`

}

fs.rmSync("output", {recursive: true, force: true})
