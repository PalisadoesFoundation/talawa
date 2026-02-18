// scripts/askDocker.ts
import { spinner } from '@clack/prompts';
import { writeFileSync } from 'node:fs';
import { join } from 'node:path';

export function addDockerConfig(pluginName: string, PLUGINS_DIR: string): void {
  const root = join(PLUGINS_DIR, pluginName);
  const spin = spinner();
  spin.start('Adding Docker configuration…');

  writeFileSync(
    join(root, 'Dockerfile'),
    `# Dockerfile for ${pluginName}
FROM node:20-alpine
WORKDIR /app
COPY . .
RUN pnpm install --prod
CMD ["node", "dist/index.js"]
`,
  );

  writeFileSync(
    join(root, 'docker-compose.yaml'),
    `services:
  ${pluginName}:
    build: .
    container_name: ${pluginName}-srv
    ports:
      - "3000:3000"
`,
  );

  spin.stop('Docker files created.');
}
