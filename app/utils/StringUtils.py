import re
import unicodedata

class StringUtils:
    """
    Utility class for string manipulation and normalization operations.
    Provides methods for cleaning and standardizing text data.
    """

    @staticmethod
    def normalize_spaces(text: str) -> str:
        """
        Normalize spaces in a string by replacing multiple spaces with a single space.
        
        Args:
            text (str): The input string to normalize.
        
        Returns:
            str: The normalized string with single spaces.
        """
        if text is None:
            return None

        return re.sub(r'\s+', ' ', text).strip()
