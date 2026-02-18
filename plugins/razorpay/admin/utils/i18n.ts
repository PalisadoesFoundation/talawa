/**
 * Internationalization (i18n) setup for Razorpay Plugin
 *
 * This module configures i18next for the Razorpay plugin following
 * the same patterns as talawa-admin.
 *
 * **IMPORTANT**: This module uses `useSuspense: true` which requires all consuming
 * components to be wrapped in a `<React.Suspense>` boundary. Without this, runtime
 * errors will occur when translations are loading.
 *
 * @example
 * ```tsx
 * // In your app entry point:
 * import './utils/i18n';
 *
 * // In components:
 * import { useTranslation } from 'react-i18next';
 *
 * function MyComponent() {
 *   const { t } = useTranslation('razorpay');
 *   return <h1>{t('donation.title')}</h1>;
 * }
 *
 * // Wrap with Suspense:
 * <Suspense fallback={<Loading />}>
 *   <MyComponent />
 * </Suspense>
 * ```
 *
 * @module i18n
 */

import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import LanguageDetector from 'i18next-browser-languagedetector';
import HttpApi from 'i18next-http-backend';

/**
 * Supported languages for the Razorpay plugin
 * @readonly
 * TODO: Add additional languages (hi, es, fr, de) when translations are available
 */
export const supportedLanguages = ['en'] as const;

/**
 * Initialize i18next with React bindings and language detection
 */
i18n
  .use(initReactI18next)
  .use(LanguageDetector)
  .use(HttpApi)
  .init({
    ns: ['razorpay'],
    defaultNS: 'razorpay',
    fallbackLng: 'en',
    supportedLngs: supportedLanguages,
    detection: {
      order: ['cookie', 'htmlTag', 'localStorage', 'path', 'subdomain'],
      caches: ['cookie'],
    },
    backend: {
      loadPath: '/locales/{{lng}}/{{ns}}.json',
    },
    interpolation: {
      escapeValue: false, // React already escapes values
    },
    react: {
      // IMPORTANT: Requires consuming components to be wrapped in <React.Suspense>
      // See module-level JSDoc for usage example
      useSuspense: true,
    },
  });

/**
 * Configured i18next instance for the Razorpay plugin.
 *
 * @example
 * ```tsx
 * // Import to initialize i18n (typically in your app entry point)
 * import './utils/i18n';
 *
 * // Then use in components with react-i18next hooks:
 * import { useTranslation } from 'react-i18next';
 *
 * const { t } = useTranslation('razorpay');
 * t('donation.form.amountLabel'); // "Amount"
 * ```
 */
export default i18n;
