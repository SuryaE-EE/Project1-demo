# Use Amazon Linux 2023 base image
FROM amazonlinux:2023

# Install Apache (httpd) using dnf package manager
RUN dnf install -y httpd && \
    dnf clean all

# Copy your index.html into Apache's web root
COPY index.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache in the foreground (so container stays alive)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
