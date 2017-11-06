/* Copyright 2016 Esteve Fernandez <esteve@apache.org>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <ROS_example_interfaces/srv/AddTwoInts.h>
#import <rclobjc/ROSRCLObjC.h>

int main() {
  [ROSRCLObjC rclInit];
  ROSNode *node = [ROSRCLObjC createNode:@"add_two_ints_client"];

  ROSClient<ROS_example_interfaces_srv_AddTwoInts *> *client =
      [node createClient:[ROS_example_interfaces_srv_AddTwoInts class]:
                             @"add_two_ints"];

  ROS_example_interfaces_srv_AddTwoInts_Request *request =
      [[ROS_example_interfaces_srv_AddTwoInts_Request alloc] init];
  request.a = 5;
  request.b = 8;

  [client
      sendRequest:
          request:^(ROS_example_interfaces_srv_AddTwoInts_Response *response) {
            NSLog(@"Incoming response\n");
            NSLog(@"sum: %lld\n", [response sum]);
          }];

  while ([ROSRCLObjC ok]) {
    [ROSRCLObjC spinOnce:node];
  }
  return 0;
}
