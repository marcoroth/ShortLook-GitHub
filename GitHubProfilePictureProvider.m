#import "GitHubProfilePictureProvider.h"

@implementation GitHubProfilePictureProvider

  - (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NSDictionary *alert = [notification applicationUserInfo];
    NSString *title = alert[@"aps"][@"alert"][@"title"];

    NSString *username = [title componentsSeparatedByString:@" "][0];
    username = [username stringByReplacingOccurrencesOfString:@"@" withString:@""];

    NSString *imageURLStr = [NSString stringWithFormat:@"https://github.com/%@.png", username];
    NSURL *imageURL = [NSURL URLWithString:imageURLStr];

    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:imageURLStr fromURL:imageURL];
  }

@end
