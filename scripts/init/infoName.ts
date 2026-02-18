// scripts/askName.ts
import { text, isCancel, cancel } from '@clack/prompts';
import { existsSync } from 'node:fs';
import { join } from 'node:path';
import bold from 'chalk';
import red from 'chalk';

const PLUGINS_DIR = 'plugins'; // customise if needed

export async function promptForPluginName(): Promise<string> {
  while (true) {
    const answer = await text({
      message: '🔧  Plugin name:',
      placeholder: 'awesome-plugin',
      validate: (v) =>
        /^[a-z0-9-]+$/.test(v)
          ? undefined
          : 'Use lowercase letters, numbers, and dashes only.',
    });

    if (isCancel(answer)) {
      cancel('Operation cancelled.');
      process.exit(0);
    }

    const pluginName = answer as string;
    const pluginPath = join(PLUGINS_DIR, pluginName);

    if (existsSync(pluginPath)) {
      console.log(
        red(
          `⚠️  A plugin called “${bold(pluginName)}” already exists. Try another name.`,
        ),
      );
      continue;
    }

    return pluginName;
  }
}
