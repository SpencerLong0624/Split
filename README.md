# How to use our Split App  

## Enable Light mode on your device when testing our app

## Currently, our codebase is not scaled for larger bills containing a lot of items. When dealing with bills that contain a larger amount of items, sufficient breaks between each user interaction should be allowed in order for the operation to be fully completed on the backend side. The following three operations are slow in a bill with a lot of items: editing an item from a bill, deleting an item from a bill, and assiging an item to a user in a bill. A concrete use flow of this example is: After deleting an item from a large bill, some time is needed for backend operations to fully complete before trying to delete another item.

### You can use existing accounts in the database to play around with features
* uzair@gmail.com
Password: 123456
* anthony@gmail.com Password: helloworld
* spencer@gmail.com Password: 123456

### Account Creation
1. Create your own account <br/>
Make sure the email is valid and the password is atleast 6 characters in length <br/>

### Acitivty View
1. You can search for a bill, filter bills and add new friends in your account. Search for friends using their email.

### Create a new Bill
1. To create a new bill, pick one friend as a Bill Payer and other as bill owers <br/>
2. Swipe left to edit or delete an item <br/>
<img width="200" alt="Screenshot 2022-12-08 at 8 50 33 PM" src="https://user-images.githubusercontent.com/54990502/206608537-276baac7-ca3c-44fa-8f36-fa300f93bd6b.png">

3. To assign items to Friends, click on a Friend and assign items using the radio button. <br/>
<img width="200" alt="Screenshot 2022-12-08 at 9 17 49 PM" src="https://user-images.githubusercontent.com/54990502/206609043-4d7328ae-c77b-4b2a-8aa6-a4d3fb070d6f.png">

5. For current version of the app, each item can be assigned to only one friend. 
6. Scanning a receipt <br/>
<b> Note: Receipt Images with only .jpg format will work </b> <br/>
<b> Our Receipt Scanner works best with 'Giant Eagle' receipts. Its best to use a Giant Eagle receipt when testing, though other receipts will give a fairly accurate output too </b> <br/>
  * Take a picture of your receipt or download from the Internet (.jpg format) 
* Drag the Image in the gallery of the app simmulator 
<img width="1047" alt="Screenshot 2022-12-06 at 10 06 38 PM" src="https://user-images.githubusercontent.com/54990502/206078553-2fc57d8e-34b1-41bf-8679-9908287baa2a.png"> 
  <br/>
* If you are testing on your device, the app will open the phone gallery and you can select the image of the receipt for scan. <br/>
* The receipts we used to build the receipt scanner is as follows: <br/>
<br/>
<img width="200" alt="Screenshot 2022-12-08 at 9 55 26 PM" src="https://user-images.githubusercontent.com/54990502/206614590-4012f173-9273-4e2e-9386-4cf844cc791c.png">

<img width="200" alt="Screenshot 2022-12-08 at 9 17 49 PM" src="https://user-images.githubusercontent.com/89931915/207776925-39a69c00-dca4-4d79-a408-fed14a31fb73.jpg">

<img width="200" alt="Screenshot 2022-12-08 at 9 17 49 PM" src="https://user-images.githubusercontent.com/89931915/207776967-544e3cbf-64ca-492c-8bcb-2a829215cd65.PNG">

5. If the output from the scanner lists unwanted items, feel free to delete them by swiping left on the item.
6. Complete the bill. Go back to acitivty page to see who owe/is owed how much in each bill. <br/>
  
### My Account
1. Each user has to enter their full name and phone number for the first time they log into the app
2. Feel free to edit your full name and phone number later.


