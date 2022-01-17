from django.test import SimpleTestCase
from django.urls import reverse, resolve
from core.views import privacy_policyview, UserList, UserDetail, FlockList, FlockDetail, MemberList, MemberDetail, MessageList


class TestUrls(SimpleTestCase):

    def test_privacy_policy_is_resolved(self):
        url = reverse('privacy_policyview')
        print(resolve(url))
        self.assertEquals(resolve(url).func, privacy_policyview)

    # def test_UserList_is_resolved(self):
    #     url = reverse('api/v1/users/')
    #     print(resolve(url))
    #     self.assertEquals(resolve(url).func, UserList)