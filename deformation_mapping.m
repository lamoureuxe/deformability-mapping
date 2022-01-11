% Mechanical Engineering 338A - Continuum Mechanics
% Erik Lamoureux - 006321065
% July 13, 2018
% Homework 1

%% Problem 1: Simple deformation mapping questions (35)

% Initialize alpha
alpha = [0.1 0.6 0.95];

% Iterate through all three alpha values
for h = 1:3
    
    % Iterate through all vertical lines
    for i = 1:11
        
        % Iterate through lines with a resolution of 201 points
        for j = 1:201
            
            % Determine X1 and X2 for the reference configuration
            X1(i,1,j) = -1 + 0.2*(i - 1);
            X1(i,2,j) = 1 - 0.01*(j - 1); 
            
            % Determine x1 and x2 for the deformed configuration
            phi_X(i,1,j) = (X1(i,1,j) + alpha(h).*X1(i,1,j).*(X1(i,2,j) - 1).*(X1(i,2,j) + 1));
            phi_X(i,2,j) = (X1(i,2,j) - alpha(h).*X1(i,2,j).*(X1(i,1,j) - 1).*(X1(i,1,j) + 1));  
            
        end
        
        % Convert multidimensional arrays to matrices to be used in plots
        X_1(i,:) = X1(i,1,:);
        X_2(i,:) = X1(i,2,:);
        phi_X1(i,:) = phi_X(i,1,:);
        phi_X2(i,:) = phi_X(i,2,:);
        
        % Plot reference configuration
        subplot(2,2,1)
        plot(X_1(i,:),X_2(i,:))
        xlim([-2 2])
        ylim([-2 2])
        hold on
        
        % Plot deformed configuration
        subplot(2,2,h+1)
        plot(phi_X1(i,:),phi_X2(i,:))
        xlim([-2 2])
        ylim([-2 2])
        hold on
        
    end
    
    % Iterate through all horizontal lines
    for i = 1:11
                
        % Iterate through lines with a resolution of 201 points
        for j = 1:201
            
            % Determine X1 and X2 for the reference configuration
            X1(i,1,j) = -1 + 0.01*(j - 1);
            X1(i,2,j) = 1 - 0.2*(i - 1);

            % Determine x1 and x2 for the deformed configuration
            phi_X(i,1,j) = (X1(i,1,j) + alpha(h).*X1(i,1,j).*(X1(i,2,j) - 1).*(X1(i,2,j) + 1));
            phi_X(i,2,j) = (X1(i,2,j) - alpha(h).*X1(i,2,j).*(X1(i,1,j) - 1).*(X1(i,1,j) + 1));
            
        end
        
        % Convert multidimensional arrays to matrices to be used in plots
        X_1(i,:) = X1(i,1,:);
        X_2(i,:) = X1(i,2,:);
        phi_X1(i,:) = phi_X(i,1,:);
        phi_X2(i,:) = phi_X(i,2,:);
        
        % Plot reference configuration
        subplot(2,2,1)
        plot(X_1(i,:),X_2(i,:))
        xlim([-2 2])
        ylim([-2 2])
        xlabel('X_1')
        ylabel('X_2')
        title('X_2 v. X_1 in reference configuration B_0')
        hold on
        
        % Plot deformed configuration
        subplot(2,2,h+1)
        plot(phi_X1(i,:),phi_X2(i,:))
        xlim([-2 2])
        ylim([-2 2])
        xlabel('x_1')
        ylabel('x_2')
        title(['x_2 v. x_1 in deformed configuration for {\alpha} = ',num2str(alpha(h)) ])
        hold on
        
    end
    
end