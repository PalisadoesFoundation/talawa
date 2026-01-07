# Talawa Setup Using Docker

## Step 1 : Build the Docker image
```bash
docker-compose build
```
## Step 2 : Start the Container
```bash
docker-compose up -d
```
## Step 3 : Access the Container
```bash
docker-compose exec talawa-mobile bash
```
----------------------

After step 3, now you are inside the container and now you can build the apk and debug the application.

## Running the app in a Physical Device

- **Step 1**: Make sure the local system and the physical device are connected to same Internet or wifi.
- **Step 2**: Run this following commands in the command prompt of the local machine.
```bash
adb tcpip 5555
```
```bash
adb connect <phone-ip>:5555
```
- The output must show as `Connected`.

- **Step 3** : Go to the Code Editor Terminal and run the command to access the Container bash. And run the following command.
```bash
adb connect <phone-ip>:5555
```
```bash
flutter run --debug
```