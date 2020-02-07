const prettierrc = require('@equipindustry/prettierrc');
module.exports = {
  parser: '@typescript-eslint/parser',
  extends: ['@equipindustry/eslint-config'],
  plugins: ['prettier', '@typescript-eslint'],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 2018,
    sourceType: 'module',
  },
  rules: {
    'prettier/prettier': [
      'error',
      prettierrc,
      {
        usePrettierrc: true,
      },
    ],
  },
};
