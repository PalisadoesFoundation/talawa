/**
 * Internationalization (i18n) setup for Plugin Map
 *
 * NOTE: The configuration below uses `react: { useSuspense: true }`.
 * Any component using `useTranslation` (e.g. `useTranslation('plugin-map')`)
 * MUST be rendered within a React <Suspense> boundary to avoid unhandled promise errors
 * (or "Suspended" errors) during locale loading.
 *
 * Recommended usage:
 * <Suspense fallback={<div>Loading...</div>}>
 *   <YourComponent />
 * </Suspense>
 */
import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import LanguageDetector from 'i18next-browser-languagedetector';
import HttpApi from 'i18next-http-backend';

export const supportedLanguages = ['en'] as const;

i18n
  .use(initReactI18next)
  .use(LanguageDetector)
  .use(HttpApi)
  .init({
    ns: ['plugin-map'],
    defaultNS: 'plugin-map',
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
      escapeValue: false,
    },
    react: {
      useSuspense: true,
    },
  });

// Handle locale loading errors
i18n.on('failedLoading', (lng, ns, msg) => {
  console.error(`Failed to load ${ns} for language ${lng}:`, msg);
  // Fallback to default language if not already
  if (lng !== 'en') {
    i18n.changeLanguage('en');
  }
});

export default i18n;
