import { computed } from 'vue';
import { router } from '@inertiajs/vue3';

/**
 * Reusable pagination utility for handling pagination logic
 * @param {Object} paginationData - Laravel pagination data object
 * @param {Object} currentFilters - Current search/filter parameters
 * @param {String} routeName - Route name for navigation
 * @param {Object} options - Additional options
 * @returns {Object} Pagination utilities and computed properties
 */
export function usePagination(paginationData, currentFilters = {}, routeName = '', options = {}) {
    const {
        preserveState = true,
        preserveScroll = false,
        maxVisiblePages = 5
    } = options;

    /**
     * Navigate to a specific page
     * @param {Number} page - Page number to navigate to
     */
    const goToPage = (page) => {
        if (page < 1 || page > paginationData.value.last_page) return;
        
        const params = {
            page: page,
            ...currentFilters.value
        };
        
        // Remove empty parameters
        Object.keys(params).forEach(key => {
            if (params[key] === '' || 
                params[key] === null || 
                params[key] === undefined ||
                (Array.isArray(params[key]) && params[key].length === 0)) {
                delete params[key];
            }
        });

        // Use route name if provided, otherwise use current URL
        const url = routeName ? route(routeName) : window.location.pathname;
        
        router.get(url, params, {
            preserveState,
            preserveScroll
        });
    };

    /**
     * Go to the next page
     */
    const nextPage = () => {
        if (paginationData.value.current_page < paginationData.value.last_page) {
            goToPage(paginationData.value.current_page + 1);
        }
    };

    /**
     * Go to the previous page
     */
    const prevPage = () => {
        if (paginationData.value.current_page > 1) {
            goToPage(paginationData.value.current_page - 1);
        }
    };

    /**
     * Go to the first page
     */
    const firstPage = () => {
        goToPage(1);
    };

    /**
     * Go to the last page
     */
    const lastPage = () => {
        goToPage(paginationData.value.last_page);
    };

    /**
     * Computed property for visible page numbers with smart ellipsis
     */
    const visiblePages = computed(() => {
        const current = paginationData.value.current_page;
        const last = paginationData.value.last_page;
        const pages = [];
        
        if (last <= maxVisiblePages) {
            // Show all pages if total pages are less than max visible
            for (let i = 1; i <= last; i++) {
                pages.push(i);
            }
        } else {
            const delta = Math.floor(maxVisiblePages / 2);
            
            // Always show first page
            pages.push(1);
            
            let start = Math.max(2, current - delta);
            let end = Math.min(last - 1, current + delta);
            
            // Adjust start and end to show maxVisiblePages - 2 (excluding first and last)
            if (end - start + 1 < maxVisiblePages - 2) {
                if (start === 2) {
                    end = Math.min(last - 1, start + maxVisiblePages - 3);
                } else {
                    start = Math.max(2, end - maxVisiblePages + 3);
                }
            }
            
            // Add ellipsis before start if needed
            if (start > 2) {
                pages.push('...');
            }
            
            // Add middle pages
            for (let i = start; i <= end; i++) {
                pages.push(i);
            }
            
            // Add ellipsis after end if needed
            if (end < last - 1) {
                pages.push('...');
            }
            
            // Always show last page (if not already added)
            if (last > 1) {
                pages.push(last);
            }
        }
        
        return pages;
    });

    /**
     * Computed property to check if pagination should be shown
     */
    const shouldShowPagination = computed(() => {
        return paginationData.value.last_page > 1;
    });

    /**
     * Computed property for pagination info text
     */
    const paginationInfo = computed(() => {
        const { current_page, per_page, total, from, to } = paginationData.value;
        return {
            current_page,
            per_page,
            total,
            from: from || 0,
            to: to || 0,
            showing: `Showing ${from || 0} to ${to || 0} of ${total} results`
        };
    });

    /**
     * Computed properties for navigation states
     */
    const canGoPrev = computed(() => paginationData.value.current_page > 1);
    const canGoNext = computed(() => paginationData.value.current_page < paginationData.value.last_page);
    const isFirstPage = computed(() => paginationData.value.current_page === 1);
    const isLastPage = computed(() => paginationData.value.current_page === paginationData.value.last_page);

    return {
        // Navigation methods
        goToPage,
        nextPage,
        prevPage,
        firstPage,
        lastPage,
        
        // Computed properties
        visiblePages,
        shouldShowPagination,
        paginationInfo,
        canGoPrev,
        canGoNext,
        isFirstPage,
        isLastPage,
        
        // Raw pagination data
        currentPage: computed(() => paginationData.value.current_page),
        lastPage: computed(() => paginationData.value.last_page),
        total: computed(() => paginationData.value.total),
        perPage: computed(() => paginationData.value.per_page)
    };
}

/**
 * Search utility for handling search and filter operations
 * @param {Object} searchForm - Reactive search form data
 * @param {String} routeName - Route name for navigation
 * @param {Object} options - Additional options
 * @returns {Object} Search utilities
 */
export function useSearch(searchForm, routeName = '', options = {}) {
    const {
        preserveState = true,
        preserveScroll = true,
        debounceMs = 0
    } = options;

    let debounceTimer = null;

    /**
     * Perform search with current form data
     */
    const performSearch = () => {
        const params = { ...searchForm.value };
        
        // Remove empty parameters
        Object.keys(params).forEach(key => {
            if (params[key] === '' || 
                params[key] === null || 
                params[key] === undefined ||
                (Array.isArray(params[key]) && params[key].length === 0)) {
                delete params[key];
            }
        });

        // Use route name if provided, otherwise use current URL
        const url = routeName ? route(routeName) : window.location.pathname;
        
        router.get(url, params, {
            preserveState,
            preserveScroll
        });
    };

    /**
     * Search with optional debouncing
     */
    const search = () => {
        if (debounceMs > 0) {
            if (debounceTimer) {
                clearTimeout(debounceTimer);
            }
            debounceTimer = setTimeout(performSearch, debounceMs);
        } else {
            performSearch();
        }
    };

    /**
     * Clear all search filters
     */
    const clearSearch = () => {
        Object.keys(searchForm.value).forEach(key => {
            if (Array.isArray(searchForm.value[key])) {
                searchForm.value[key] = [];
            } else {
                searchForm.value[key] = '';
            }
        });
        search();
    };

    return {
        search,
        performSearch,
        clearSearch
    };
}
