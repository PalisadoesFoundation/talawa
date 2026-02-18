// scripts/index.ts
import { intro, outro, isCancel } from '@clack/prompts';
import bold from 'chalk';
import green from 'chalk';
import { promptForPluginName } from './infoName';
import { promptForDocker } from './infoDocker';
import { createAdminSkeleton } from './initAdmin';
import { createAPISkeleton } from './initApi';
import { addDockerConfig } from './initDocker';

const PLUGINS_DIR = 'plugins';

async function main() {
  intro(`${bold('Talawa Plugin Generator')}`);

  try {
    const pluginName = await promptForPluginName();

    // Create API skeleton (server-side)
    createAPISkeleton(pluginName, PLUGINS_DIR);

    // Create Admin skeleton (web interface)
    createAdminSkeleton(pluginName, PLUGINS_DIR);

    // Optional Docker configuration
    if (await promptForDocker()) {
      addDockerConfig(pluginName, PLUGINS_DIR);
    }

    outro(
      green(
        `Plugin "${pluginName}" scaffolded successfully with API and Admin modules.`,
      ),
    );
  } catch (err: unknown) {
    process.exitCode = 1;
  }
}

main();
