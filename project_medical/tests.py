from django.test import TestCase
from project_medical.utils import PrettyJsonRenderer


class DefaultIndentTest(TestCase):
    def test_indent_is_4(self):
        self.assertEqual(PrettyJsonRenderer().get_indent(None, None), 4)
